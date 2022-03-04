<?php

namespace Modules\Setups\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;

use Modules\Projects\Entities\Engagement;
use Modules\Setups\Entities\Designation;

class DesignationController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('permission');
    }
   
    public function index()
    {
        $data = [
            'designations' => Designation::all()
        ];
        return view('setups::designations.index',$data);
    }

    public function create()
    {
        $data = [
            'engagements' => Engagement::where('status',1)->get()
        ];
        return view('setups::designations.create',$data);
    }

    public function store(Request $request, Designation $designation)
    {
        $request->validate([
            'name' => 'required|unique:designations',
            'rate' => 'required',
            'hours' => 'required',
            'hours.*' => 'required',
        ]);

        $designation->fill($request->all());
        $designation->hours = json_encode($request->hours);
        $designation->save();

        return is_save($designation, 'Designation Has been Added.');
    }

    public function show($id)
    {
        return view('setups::designations.show');
    }

    public function edit($id)
    {
        $data = [
            'engagements' => Engagement::where('status',1)->get(),
            'designation' => Designation::findOrFail($id)
        ];
        return view('setups::designations.edit',$data);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'rate' => 'required',
            'hours' => 'required',
            'hours.*' => 'required',
            'status' => 'required'
        ]);

        $designation = Designation::findOrFail($id);
        $designation->fill($request->all());
        $designation->hours = json_encode($request->hours);
        $designation->save();

        return is_save($designation, 'Designation has been updated');
    }

    public function destroy($id)
    {
        $designation = Designation::find($id)->delete();
        if($designation){
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
