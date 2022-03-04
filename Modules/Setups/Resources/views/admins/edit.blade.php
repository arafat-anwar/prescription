<form action="{{ route('admins.update', $admin->id) }}" method="post" id="create-form" enctype="multipart/form-data">
@csrf
@method('PUT')
  <div class="form-group row">
    <div class="col-md-6">
      <label for="name"><strong>Name :&nbsp;<span class="text-danger">*</span></strong></label>
      <input type="text" class="form-control" name="name" id="name" value="{{ $admin->name }}">
    </div>
    <div class="col-md-6">
      <label for="phone"><strong>Phone :&nbsp;<span class="text-danger">*</span></strong></label>
      <input type="text" class="form-control" name="phone" id="phone" value="{{ $admin->profile ? $admin->profile->phone : '' }}">
    </div>
  </div>
  <div class="form-group row">
    <div class="col-md-6">
      <label for="email"><strong>E-mail :</strong></label>
      <input type="email" class="form-control" name="email" id="email" value="{{ $admin->email }}">
    </div>
    <div class="col-md-6">
      <label for="gender"><strong>Gender :&nbsp;<span class="text-danger">*</span></strong></label>
      <br>
      @if(is_array(genders()))
      @foreach (genders() as $key => $gender)
        <div class="icheck-primary d-inline">
          <input type="radio" id="gender-radio-{{$key}}" name="gender" value="{{$key}}" {{ (($admin->gender == $key) ? 'checked' : '') }}>
          <label for="gender-radio-{{$key}}" class="text-primary pb-2">
            {{$gender}}&nbsp;&nbsp;
          </label>
        </div>
      @endforeach
      @endif
    </div>
  </div>
  <div class="form-group">
    <label for="role_id"><strong>Role :&nbsp;<span class="text-danger">*</span></strong></label>
    <br>
    @if(isset($roles[0]))
    @foreach ($roles as $key => $role)
      <div class="icheck-success d-inline">
        <input type="radio" id="role-radio-{{$role->id}}" name="role_id" value="{{$role->id}}" {{ (($admin->role_id == $role->id) ? 'checked' : '') }}>
        <label for="role-radio-{{$role->id}}" class="text-success pb-2">
          {{$role->name}}&nbsp;&nbsp;
        </label>
      </div>
    @endforeach
    @endif
  </div>
  <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp; Update Admin</button>
</form>
<script type="text/javascript">
  $('.select2bs4').select2({
    theme: 'bootstrap4'
  });
</script>