<table class="table table-bordered">
    <thead>
        <tr>
            <th>SL</th>
            <th>Status</th>
            <th>Updated By</th>
            <th>Updated At</th>
        </tr>
    </thead>

    <tbody>
    @if(isset($project->statuses[0]))
    @foreach($project->statuses as $key => $status)
    <tr>
        <td>{{ $key+1 }}</td>
        <td>{{ $status->getStatus ? $status->getStatus->name : '' }}</td>
        <td>{{ $status->user ? $status->user->name : '' }}</td>
        <td>{{ date('F j, Y g:i a', strtotime($status->created_at)) }}</td>
    </tr>
    @endforeach
    @endif
    </tbody>
</table>