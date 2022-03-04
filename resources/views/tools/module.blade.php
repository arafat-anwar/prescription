<div class="row">
@php
$menus = \Modules\Setups\Entities\Menu::where([
            'module_id' => $module_id,
            'status' => 1
          ])
          ->whereIn('id', is_array(json_decode(auth()->user()->role->permissions, true)['menu']) ? json_decode(auth()->user()->role->permissions, true)['menu'] : [])
          ->orderBy('serial','asc')
          ->orderBy('name','asc')
          ->get();
@endphp
  @if(isset($menus[0]))
  @foreach($menus as $key => $menu)
  @php
    $submenus = \Modules\Setups\Entities\Submenu::where([
        'menu_id' => $menu->id,
        'status' => 1
      ])
      ->whereIn('id', is_array(json_decode(auth()->user()->role->permissions, true)['submenu']) ? json_decode(auth()->user()->role->permissions, true)['submenu'] : [])
      ->orderBy('serial','asc')
      ->orderBy('name','asc')
      ->get();
  @endphp
    
    @if($submenus->count() > 0)
    <h3 class="pl-3 mb-0"><i style="font-size: 22px" class="{{ !empty($menu->icon) ? $menu->icon : 'fa fa-tasks' }}"></i><strong>&nbsp;{{ $menu->name }}</strong></h3>
    <div class="col-12">
    <hr>
      <div class="row">
        @foreach($submenus as $key => $submenu)
        <div class="col-lg-3 col-6 mb-2">
          <div class="small-box bg-info">
            <div class="inner">
              <h4>{{ $submenu->name }}</h4>
              <p></p>
            </div>
            <div class="icon">
              <i style="font-size: 60px;" class="{{ !empty($submenu->icon) ? $submenu->icon : 'fa fa-tasks' }}"></i>
            </div>
            <a href="{{ url($menu->module->route.'/'.$submenu->route) }}" class="small-box-footer mt-4">View Contents <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
        @endforeach
      </div>
    </div>
    @else
      <div class="col-lg-3 col-6 mb-2">
        <div class="small-box bg-info">
          <div class="inner">
            <h4>{{ $menu->name }}</h4>
            <p></p>
          </div>
          <div class="icon">
            <i style="font-size: 60px;" class="{{ !empty($menu->icon) ? $menu->icon : 'fa fa-tasks' }}"></i>
          </div>
          <a href="{{ url($menu->module->route.'/'.$menu->route) }}" class="small-box-footer mt-4">View Contents <i class="fas fa-arrow-circle-right"></i></a>
        </div>
      </div>
    @endif
  @endforeach
  @endif
</div>
