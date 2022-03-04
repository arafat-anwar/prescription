<?php
function collapseMenuName($name){
    $explode = explode(' ', $name);
    $menu = '';
    if(count($explode) > 1){
        foreach ($explode as $key => $value) {
            if($key > 0 && $key%2 == 0){
                $menu .= '<br>';
            }
            $menu .= $value.' ';
        }
    }else{
        $menu = $name;
    }

    return $menu;
}

function formatExcelDate($value){
    return date('d-m-y', strtotime(\Carbon\Carbon::instance(\PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($value))));
}

function sendEmail($email,$type,$message)
{
    $mail=\Mail::send('emails.message', ['msg' => $message,'type'=>$type], function ($msg) use ($email){
        $msg
          ->to($email->email,$email->name)
          ->subject($email->subject);
    });

    return $message->id;
}

function genders(){
    return array(
        'Female',
        'Male',
        'Others',
    );
}
function gendersbn(){
    return array(
        'মহিলা',
        'পুরুষ',
        'অন্যান্য',
    );
}

function maritalStatus(){
    return array(
        'Single',
        'Married',
        'Divorced',
    );
}

function bloodGroups(){
    return array(
        'N/A',
        'A+',
        'A-',
        'B+',
        'B-',
        'O+',
        'O-',
        'AB+',
        'AB-',
    );
}

function weekDays(){
    return array(
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday",
    );
}

function weekDaysIndex(){
    return array(
        "Monday" => 0,
        "Tuesday" => 1,
        "Wednesday" => 2,
        "Thursday" => 3,
        "Friday" => 4,
        "Saturday" => 5,
        "Sunday" => 6,
    );
}

function minutesDifference($from,$to)
{
    $start_date = new DateTime($from);
    $since_start = $start_date->diff(new DateTime($to));
    $minutes = $since_start->days * 24 * 60;
    $minutes += $since_start->h * 60;
    $minutes += $since_start->i;
    return $minutes;
}

function freeLinks()
{
	$links = array();
	$freeLinks=\Modules\Setups\Entities\FreeLink::where('status',1)->get();
    if(isset($freeLinks[0])){
        foreach ($freeLinks as $key => $link) {
        	array_push($links, $link->route);
        }
    }
    return $links;
}

function this_url(){
    return request()->route()->uri;
}

function getModule($url)
{
    $module=\Modules\Setups\Entities\Module::where('route',trim($url))->first();
    if(isset($module->id)){
        return $module;
    }
    return false;
}

function getMenu($url)
{
    $menu=\Modules\Setups\Entities\Menu::where('route',trim($url))->first();
    if(isset($menu->id)){
        return $menu;
    }
    return false;
}

function getSubmenu($url)
{
    $submenu=\Modules\Setups\Entities\Submenu::where('route',trim($url))->first();
    if(isset($submenu->id)){
        return $submenu;
    }
    return false;
}

function checkPermission($needle,$haystack,$option){
    
    if(isset(json_decode($haystack,true)[$option])){
        $haystack=json_decode($haystack,true)[$option];
        if(isset($haystack[0])){
            if(in_array($needle, $haystack)){
                return true;
            }
        }
    }

    return false;
}

function isOptionPermitted($route,$option_name){
    $links = explode('/',$route);
    $menu_id = getMenu($links[1]) ? getMenu($links[1])->id : false;
    $submenu_id = getSubmenu($links[1]) ? getSubmenu($links[1])->id : false;

    $option = \Modules\Setups\Entities\Option::where('name','LIKE','%'.$option_name.'%')
                                            ->when($menu_id,function($query) use($menu_id){
                                                return $query->where('menu_id',$menu_id);
                                            })
                                            ->when($submenu_id,function($query) use($submenu_id){
                                                return $query->where('submenu_id',$submenu_id);
                                            })
                                            ->first();
    if(isset($option->id)){
        return checkPermission($option->id,auth()->user()->role->permissions,'options');
    }

    return false;
}

function shiftTypes($key=false){
    $types=array(
        '7 hours (+1 hour Lunch)',
        '8 hours (+1 hour Lunch)',
    );

    if($key){
        if(array_key_exists($key, $types)){
            return $types[$key];
        }
    }

    return $types;
}

function nameWithoutUID($employee){
    return $employee->first_name.' '.$employee->middle_name.' '.$employee->last_name; 
}

function nameWithUID($employee){
    return $employee->first_name.' '.$employee->middle_name.' '.$employee->last_name.' ('.$employee->uid.')'; 
}

function dateRange($from, $to, $format = "Y-m-d")
{
    $range = [];
    if(strtotime($from) && strtotime($to)){
        $begin = new \DateTime($from);
        $end = new \DateTime($to);

        $interval = new DateInterval('P1D');
        $dateRange = new DatePeriod($begin, $interval, $end);

        
        foreach ($dateRange as $date) {
            $range[] = $date->format($format);
        }
        array_push($range, date('Y-m-d',strtotime($to)));
    }

    return $range;
}

function timeDiff($from,$to)
{
    $start_date=new \DateTime($from);
    $end_date=new \DateTime($to);
    $difference=$end_date->diff($start_date);
    return json_decode(json_encode($difference),true);
}

function downloadPDF($name,$data,$view){
    return \PDF::loadView($view, $data)->setPaper('legal', 'landscape')->download($name.'-('.date('F j,Y g:i a').').pdf');
}

function downloadPDFExtra($name,$data,$view,$paper,$orientation){
    return \PDF::loadView($view, $data)->setPaper($paper, $orientation)->download($name.'-('.date('F j,Y g:i a').').pdf');
}

function downloadExcel($view, $data, $name, $type){
    return \Excel::download(new \App\Exports\Excel($view, $data), $name.'('.date('F j,Y g:i a').')'.'.'.$type);
}

function checkWeekend($date){
    $weekend = false;

    if(date('N',strtotime($date)) == 5){
        $weekend = true;
    }

    return $weekend;
}

function checkHoliday($date){
    $holiday = false;
    
    $search = \Modules\EventManagement\Entities\Holiday::where(['date' => $date,'status' => 1])->first();
    if(isset($search->id)){
        $holiday = true;
    }
    
    return $holiday;
}

function timeDifference($from,$to)
{
    if(strtotime($from) && strtotime($to)){
        $start_date = new DateTime($from);
        $diff = $start_date->diff(new DateTime($to));

        return date('H:i:s',strtotime($diff->h.':'.$diff->i.':'.$diff->s));
    }

    return false;
}

function ratingsColor(){
    return [
        1 => 'danger',
        2 => 'warning',
        3 => 'info',
        4 => 'primary',
        5 => 'success',
    ];
}
