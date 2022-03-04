<form action="{{ route('admins.store') }}" method="post" id="create-form" enctype="multipart/form-data">
@csrf
  <div class="form-group row">
    <div class="col-md-6">
      <label for="name"><strong>Name :&nbsp;<span class="text-danger">*</span></strong></label>
      <input type="text" class="form-control" name="name" id="name">
    </div>
    <div class="col-md-6">
      <label for="phone"><strong>Phone :&nbsp;<span class="text-danger">*</span></strong></label>
      <input type="text" class="form-control" name="phone" id="phone">
    </div>
  </div>
  <div class="form-group row">
    <div class="col-md-6">
      <label for="username"><strong>Username :&nbsp;<span class="text-danger">*</span></strong></label>
      <input type="text" class="form-control" name="username" id="username">
    </div>
    <div class="col-md-6">
      <label for="email"><strong>E-mail :</strong></label>
      <input type="email" class="form-control" name="email" id="email">
    </div>
  </div>
  <div class="form-group row">
    <div class="col-md-6">
      <label for="password"><strong>Password :&nbsp;<span class="text-danger">*</span></strong></label>
      <input type="password" class="form-control" name="password" id="password">
    </div>
    <div class="col-md-6">
      <label for="password_confirmation"><strong>Confirm Password :&nbsp;<span class="text-danger">*</span></strong></label>
      <input type="password" class="form-control" name="password_confirmation" id="password_confirmation">
    </div>
  </div>
  <div class="form-group">
    <label for="role_id"><strong>Role :&nbsp;<span class="text-danger">*</span></strong></label>
    <br>
    @if(isset($roles[0]))
    @foreach ($roles as $key => $role)
      <div class="icheck-success d-inline">
        <input type="radio" id="status-radio-{{$role->id}}" name="role_id" value="{{$role->id}}" {{ (($key == 0) ? 'checked' : '') }}>
        <label for="status-radio-{{$role->id}}" class="text-success pb-2">
          {{$role->name}}&nbsp;&nbsp;
        </label>
      </div>
    @endforeach
    @endif
  </div>
  <div class="form-group">
    <label for="gender"><strong>Gender :&nbsp;<span class="text-danger">*</span></strong></label>
    <br>
    @if(is_array(genders()))
    @foreach (genders() as $key => $gender)
      <div class="icheck-primary d-inline">
        <input type="radio" id="gender-radio-{{$key}}" name="gender" value="{{$key}}" {{ (($key == 0) ? 'checked' : '') }}>
        <label for="gender-radio-{{$key}}" class="text-primary pb-2">
          {{$gender}}&nbsp;&nbsp;
        </label>
      </div>
    @endforeach
    @endif
  </div>
  <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp; Save Admin</button>
</form>
<script type="text/javascript">
  $('.select2bs4').select2({
    theme: 'bootstrap4'
  });
</script>