<?php

namespace Modules\Dashboard\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;

use \Modules\Departments\Entities\Department;
use \Modules\Projects\Entities\Engagement;
use \Modules\Projects\Entities\Project;
use \Modules\Projects\Entities\ProjectConsumption;

class DashboardController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->middleware('permission');
    }
    
    public function index()
    {
        return view('dashboard::index');
    }

    public function toggleStatus(Request $request)
    {
        $row = \DB::table($request->table)
                    ->where('id',$request->id)
                    ->first();
        if(isset($row->id)){
            $old_status = $row->status;
            $new_status = $old_status == 1 ? 0 : 1;
            
            $old_class = $old_status == 1 ? 'btn-success' : 'btn-danger';
            $new_class = $new_status == 1 ? 'btn-success' : 'btn-danger';

            $new_text = $new_status == 1 ? '<i class="fa fa-check text-white"></i>' : '<i class="fa fa-ban text-white"></i>';
            
            $update = \DB::table($request->table)
                        ->where('id',$request->id)
                        ->update([
                            'status' => $new_status,
                            'updated_at' => date('Y-m-d H:i:s')
                        ]);


            if(isset($row->updated_by)){
               \DB::table($request->table)
                    ->where('id',$request->id)
                    ->update([
                        'updated_by' => auth()->user()->id
                    ]);
            }

            if($update){
                return response()->json([
                    'success' => true,
                    'old_class' => $old_class,
                    'new_class' => $new_class,
                    'new_text' => $new_text,
                    'message' => 'Data has been updated!'
                ]);
            }

            return response()->json([
                'success' => false,
                'message' => 'Something Went Wrong!'
            ]);
        }

        return response()->json([
            'success' => false,
            'message' => 'Data not found!'
        ]);
    }
}
