<table class="table table-bordered">
    <thead>
        <tr>
            <th>SL</th>
            <th>Criteria</th>
            <th>Reviewer</th>
            <th>Ratings</th>
            <th>Comments</th>
            <th>at</th>
        </tr>
    </thead>

    <tbody>
    @if(isset($project->criterias[0]))
    @foreach($project->criterias as $key => $criteria)
    <tr>
        <td>{{ $key+1 }}</td>
        <td>{{ $criteria->criteria ? $criteria->criteria->name : '' }}</td>
        <td>{{ $criteria->user ? $criteria->user->name : '' }}</td>
        <td style="font-size: 10px">{!! showRatings($criteria->ratings) !!}</td>
        <td>{{ $criteria->comments }}</td>
        <td>{{ date('F j, Y g:i a', strtotime($criteria->created_at)) }}</td>
    </tr>
    @endforeach
    @endif
    </tbody>
</table>