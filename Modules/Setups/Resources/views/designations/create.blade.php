<form action="{{ route('designations.store') }}" method="post" id="create-form" enctype="multipart/form-data">
@csrf
  <div class="form-group">
    <label for="name"><strong>Name :</strong></label>
    <input type="text" class="form-control" name="name" id="name">
  </div>
  <div class="form-group">
    <label for="rate"><strong>MAH Rate :</strong></label>
    <input type="number" class="form-control" name="rate" id="rate">
  </div>
  <div class="form-group">
    <h4><strong>MAH Hours</strong></h4>
    <hr>
    <div class="row">
      @if($engagements->where('id', '!=', 1)->count() > 0)
      @foreach ($engagements->where('id', '!=', 1) as $key => $engagement)
      <div class="col-md-4 mb-2">
        <div class="form-group">
          <label for="engagement-{{ $engagement->id }}"><strong>{{ $engagement->short_name }}</strong></label>
          <input type="number" name="hours[{{ $engagement->id }}]" value="0" min="0" class="form-control">
        </div>
      </div>
      @endforeach
      @endif
    </div>
  </div>
  <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i>&nbsp; Save Designation</button>
</form>