@extends('dolil::layouts.index')

@section('content')
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="card">
            <div class="card-header"><h3>পাসওয়ার্ড উদ্ধার করুন</h3></div>

            <div class="card-body">
                @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                @endif

                <form method="POST" action="{{ route('password.email') }}">
                    @csrf

                    <div class="form-group row">
                        <label for="email" >ইমেইল লিখুন</label>

                        <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                        @error('email')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>

                    <div class="form-group row mb-0">
                        <button type="submit" class="btn btn-primary">
                            পাসওয়ার্ড পরিবর্তনের ইমেইল পাঠান
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
