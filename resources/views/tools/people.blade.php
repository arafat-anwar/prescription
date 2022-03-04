<table class="table table-bordered">
    <thead>
        <tr>
            <th>SL</th>
            <th>Consultants</th>
            <th>Duration</th>
            <th>Hours</th>
            <th>Comments</th>
        </tr>
    </thead>

    <tbody>
    @if(isset($project->distributions[0]))
    @foreach($project->distributions as $key => $distribution)
    <tr>
        <td>{{ $key+1 }}</td>
        <td>{{ $distribution->user ? $distribution->user->name : '' }}</td>
        <td><strong>{{$distribution->from}}</strong> to <strong>{{$distribution->to}}</strong></td>
        <td>{{ $distribution->hours }}</td>
        <td>{{ $distribution->desc }}</td>
    </tr>
    @endforeach
    @endif
    </tbody>
</table>