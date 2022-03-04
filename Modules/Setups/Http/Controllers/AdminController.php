<?php

namespace Modules\Setups\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;

use \Yajra\DataTables\Datatables;

use \App\User;
use \Modules\Setups\Entities\Role;
use \Modules\Setups\Entities\Profile;

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('permission');
    }
    
    public function index()
    {
        $role_id = request()->has('role_id') ? request()->get('role_id') : 0;
        $gender = request()->has('gender') ? request()->get('gender') : -1;
        $data = [
            'role_id' => $role_id,
            'gender' => $gender,
            'roles' => Role::where('status',1)
                        ->when(auth()->user()->role->is_main == 0,function($query){
                            return $query->where('is_main',0)->whereIn('id',json_decode(auth()->user()->role->sub_roles));
                        })->get(),
            'admins' => User::when($role_id > 0,function($query) use($role_id){
                            return $query->where('role_id',$role_id);
                        })
                        ->when($gender >= 0,function($query) use($gender){
                            return $query->where('gender',$gender);
                        })
                        ->when(auth()->user()->role->is_main == 0,function($query){
                            return $query->whereIn('role_id',json_decode(auth()->user()->role->sub_roles));
                        })
                        ->get(),
        ];   

        return view('setups::admins.index',$data);
    }

    public function create()
    {
        $data = [
            'roles' => Role::where('status',1)
                        ->when(auth()->user()->role->is_main == 0,function($query){
                            return $query->where('is_main',0)->whereIn('id',json_decode(auth()->user()->role->sub_roles));
                        })->get(),
        ];
        return view('setups::admins.create',$data);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'phone' => 'required',
            'username' => 'required|unique:users',
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'role_id' => 'required',
            'gender' => 'required',
        ]);

        $admin = new User();
        $admin->fill($request->all());
        $admin->username = \Str::slug($request->username);
        $admin->password = bcrypt($request->password);
        $admin->admin = 1;
        $admin->save();

        if($admin){
            Profile::create([
                'user_id' => $admin->id,
                'phone' => $request->phone,
                'status' => 1,
            ]);
        }

        systemUpdated();

        return is_save($admin, $admin->role->name.' Has been Added.');
    }

    public function show($role_id)
    {
        
    }

    public function edit($id)
    {
        $data = [
            'roles' => Role::where('status',1)
                        ->when(auth()->user()->role->is_main == 0,function($query){
                            return $query->where('is_main',0)->whereIn('id',json_decode(auth()->user()->role->sub_roles));
                        })->get(),
            'admin' => User::findOrFail($id)
        ];
        return view('setups::admins.edit',$data);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'phone' => 'required',
            'role_id' => 'required',
            'gender' => 'required',
        ]);

        $admin = User::find($id);
        $admin->fill($request->all());
        $admin->save();

        if($admin){
            Profile::where('user_id', $id)
            ->update([
                'phone' => $request->phone,
            ]);
        }

        systemUpdated();

        return is_save($admin, $admin->role->name.' Has been updated.');
    }

    public function destroy($id)
    {
        $admin = User::find($id)->delete();
        if($admin){
            return response()->json([
                'success' => true
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => 'Something went wrong!'
        ]);
    }
}
