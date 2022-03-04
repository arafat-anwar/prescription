<?php

namespace Modules\Setups\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;

use \App\User;
use \Modules\Setups\Entities\Profile;

class MyProfileController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        return view('setups::myProfile.index');
    }
    
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'phone' => 'required',
            'email' => 'required',
            'gender' => 'required',
        ]);

        $admin = User::findOrFail(auth()->user()->id);
        $admin->fill($request->all());
        $admin->save();

        Profile::where('id', $admin->id)
        ->update([
            'phone' => $request->phone
        ]);

        systemUpdated();

        return is_save($admin, 'Profile has been updated.');
    }
}
