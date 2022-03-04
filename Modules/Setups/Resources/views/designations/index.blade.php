@extends('layouts.index')

@section('content')
<div class="card" style="margin-bottom: 25px;">
    <div class="card-header bg-info text-white" style="cursor: pointer;">
        <h4>
        	<strong>Designations</strong>

            @if(isOptionPermitted('setups/designations','create'))
        	   <a class="btn btn-success btn-sm" style="float: right" onclick="Show('New Designation','{{ url('setups/designations/create') }}')"><i class=" fa fa-plus"></i>&nbsp;New Designation</a>
            @endif
        </h4>
    </div>
    <div class="card-body">
        <span id="datatable-export-file-name" style="display: none;">Designations</span>
        <table class="table table-bordered table-striped datatable">
            <thead>
                <tr>
                    <th>SL</th>
                    <th>Name</th>
                    <th>MAH Rate</th>
                    <th>MAH Hours</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            @if(isset($designations[0]))
            @foreach($designations as $key => $designation)
                <tr id="tr-{{ $designation->id }}">
                    <td style="width: 2%">{{ $key+1 }}</td>
                    <td>{{$designation->name}}</td>
                    <td class="text-right">{{$designation->rate}}</td>
                    <td>
                        @php
                            $hours = json_decode($designation->hours, true);
                        @endphp
                        @if(is_array($hours) && count($hours) > 0)
                        @foreach($hours as $engagement_id => $hour)
                        @php
                            $engagement = \Modules\Projects\Entities\Engagement::find($engagement_id);
                        @endphp
                        @if(isset($engagement->id))
                        <li>{{ $engagement->name }}: <strong>{{ $hour }}</strong></li>
                        @endif
                        @endforeach
                        @endif
                    </td>
                    <td class="text-center" style="width: 15%">
                        @include('layouts.crudButtons',[
                            'text' => 'Designation',
                            'object' => $designation,
                            'link' => 'setups/designations'
                        ])
                    </td>
                </tr>
            @endforeach
            @endif
            </tbody>
        </table>
    </div>
</div>
@endsection