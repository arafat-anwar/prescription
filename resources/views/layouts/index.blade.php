<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<title>{{systemInformation()->name}}</title>
		<link rel="stylesheet" href="{{url('public/lte')}}/plugins/fontawesome-free/css/all.min.css">
		<link rel="stylesheet" href="{{url('public/lte')}}/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
		<link rel="stylesheet" href="{{url('public/lte')}}/dist/css/adminlte.min.css">
		
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
		
		{{-- <link rel="stylesheet" href="{{url('public/lte')}}/plugins/datatables-bs4/css/dataTables.bootstrap4.css"> --}}
		
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.21/b-1.6.3/b-flash-1.6.3/b-html5-1.6.3/b-print-1.6.3/fc-3.3.1/fh-3.1.7/r-2.2.5/sc-2.0.2/datatables.min.css"/>
		
		
		<link rel="stylesheet" href="{{url('public/lte')}}/jquery-confirm/jquery-confirm.min.css">
		
		<link rel="stylesheet" href="{{url('public/lte')}}/plugins/select2/css/select2.min.css">
		<link rel="stylesheet" href="{{url('public/lte')}}/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
		
		<link rel="stylesheet" href="{{url('public/lte')}}/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
		
		<link rel="stylesheet" href="{{url('public/lte')}}/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css"/>
		
		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
		
		<link rel="stylesheet" href="{{url('public/lte')}}/plugins/summernote/summernote-bs4.css">
		<link rel="stylesheet" href="{{url('public/lte')}}/wnoty/wnoty.css">
		
		<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
		<link rel="icon" href="{{ url('public/system-images/icons/'.systemInformation()->icon) }}" type="image/png">
		
		@include('layouts.css')
	</head>
	<body class="sidebar-mini layout-fixed layout-navbar-fixed">
		
		<div class="wrapper">
			
			<!-- Navbar -->
			<nav class="main-header navbar navbar-expand navbar-white navbar-light" style="background: #343a40;color: white">
				
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" data-widget="pushmenu" href="#">
							<i class="fas fa-bars text-white"></i>
						</a>
					</li>
				</ul>
				
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<img src="{{ adminImage(auth()->user()) }}" width="40" height="40" class="rounded-circle" style="margin-top: -10px">
							&nbsp;<strong>{{auth()->user()->name}}</strong>
						</a>
						<div class="dropdown-menu" style="margin-left: -30px;margin-top: 10px;" aria-labelledby="navbarDropdownMenuLink">
							<a href="{{ url('setups/my-profile') }}" class="dropdown-item">
								<i class="fa fa-user-secret nav-icon"></i>&nbsp;My Profile
							</a>
							<a href="{{ url('setups/change-password') }}" class="dropdown-item">
								<i class="fa fa-key nav-icon"></i>&nbsp;Change Password
							</a>
							<a href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();" class="dropdown-item">
								<i class="fa fa-sign-out-alt nav-icon"></i>&nbsp;Log Out
								<form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
									@csrf
								</form>
							</a>
						</div>
					</li>   
				</ul>
			</nav>
			<!-- /.navbar -->
			
			<!-- Main Sidebar Container -->
			@include('layouts.sidebar')
			
			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				
				<!-- Content Header (Page header) -->
				<section class="content-header">
					<div class="container-fluid">
						<div class="col-12">
							<div class="row">
								<div class="col-sm-6  mb-1">
									<h1>{{ systemInformation()->name }}</h1>
								</div>
								<div class="col-sm-6  mb-1">
									<ol class="breadcrumb float-sm-right" style="">
										<li class="breadcrumb-item"><a href="{{url('dashboard')}}">Home</a></li>
										@include('layouts.where')
									</ol>
								</div>
							</div>
						</div>
					</div><!-- /.container-fluid -->
				</section> 
				
				<!-- Main content -->
				<section class="content" style="padding-top: 10px;">
					<div class="container-fluid">  
						@include('tools.modals')
						@yield('content')
					</div>
				</section>
				<!-- /.content -->
			</div>
			<!-- /.content-wrapper -->
			
			<!-- Control Sidebar -->
			<aside class="control-sidebar control-sidebar-dark">
				<!-- Control sidebar content goes here -->
			</aside>
			<!-- /.control-sidebar -->
			
			<!-- Main Footer -->
			<footer class="main-footer" >
				<div class="col-12">
					Copyright &copy; {{ date('Y') }} <a href="{{ url('dashboard') }}">{{systemInformation()->name}}</a>
					&nbsp;
					All rights reserved. 
				</div>
			</footer>
		</div>
		<!-- ./wrapper -->
		
		<script src="{{url('public/lte')}}/plugins/jquery/jquery.min.js"></script>
		<script src="{{url('public/lte')}}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="{{url('public/lte')}}/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
		<script src="{{url('public/lte')}}/dist/js/adminlte.js"></script>
		<script src="{{url('public/lte')}}/dist/js/demo.js"></script>
		<script src="{{url('public/lte')}}/plugins/chart.js/Chart.min.js"></script>
		
		<script src="{{url('public/lte')}}/jquery-confirm/jquery-confirm.min.js"></script>
		
		<script src="{{url('public/lte')}}/plugins/select2/js/select2.full.min.js"></script>
		
		<script src="{{url('public/lte')}}/wnoty/wnoty.js"></script>
			
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.21/b-1.6.3/b-flash-1.6.3/b-html5-1.6.3/b-print-1.6.3/fc-3.3.1/fh-3.1.7/r-2.2.5/sc-2.0.2/datatables.min.js"></script>
		
		<script src="//cdn.ckeditor.com/4.13.1/full/ckeditor.js"></script>
		
		<script src="{{url('public/lte')}}/plugins/summernote/summernote-bs4.min.js"></script>
		
		<script src="{{url('public/lte')}}/bootstrap-datetimepicker/moment.min.js" ></script>
		
		<script src="{{url('public/lte')}}/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
		
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
			
		@if(session()->has('success'))
		<script type="text/javascript">
			$(document).ready(function() {
				notify('{{session()->get('success')}}','success');
				playTone('success');
			});
		</script>
		@endif
		
		@if(session()->has('danger'))
		<script type="text/javascript">
			$(document).ready(function() {
				notify('{{session()->get('danger')}}','danger');
				playTone('danger');
			});
		</script>
		@endif
		
		@if($errors->any())
		<script type="text/javascript">
			$(document).ready(function() {
				playTone('danger');
				var errors=<?php echo json_encode($errors->all()); ?>;
				$.each(errors, function(index, val) {
					notify(val,'danger');
				});
			});
		</script>
		@endif
			
		<script type="text/javascript">
			var base_url="{{ url('/') }}";
			
			$(document).ready(function() {
				$('input').attr('autocomplete','off');
				
				setTimeout(function(){
					$('.half-a-second').fadeIn();
				},500);
				
				var datatable_file_name = $('#datatable-export-file-name').text();
				$('.datatable').DataTable({
					lengthMenu: [
					[ 5,10, 25, 50, 100, -1 ],
					[ '5 rows', '10 rows', '25 rows', '50 rows', '100 rows', 'Show all' ]
					],
					
					iDisplayLength: 10,
					sScrollX: "100%",
					sScrollXInner: "100%",
					scrollCollapse: true,
					
					dom: 'Bfrtip',
					buttons: [
					'pageLength',
					{
						extend: 'copy',
						title: datatable_file_name
					},
					{
						extend: 'print',
						title: datatable_file_name
					},
					{
						extend: 'csv',
						filename: datatable_file_name
					},
					{
						extend: 'excel',
						filename: datatable_file_name
					},
					{
						extend: 'pdf',
						filename: datatable_file_name
					},
					]
				});
				
				$('.buttons-collection').addClass('btn-sm');
				$('.buttons-copy').removeClass('btn-secondary').addClass('btn-sm btn-warning').html('<i class="fas fa-copy"></i>');
				$('.buttons-csv').removeClass('btn-secondary').addClass('btn-sm btn-success').html('<i class="fas fa-file-csv"></i>');
				$('.buttons-excel').removeClass('btn-secondary').addClass('btn-sm btn-primary').html('<i class="far fa-file-excel"></i>');
				$('.buttons-pdf').removeClass('btn-secondary').addClass('btn-sm btn-info').html('<i class="fas fa-file-pdf"></i>');
				$('.buttons-print').removeClass('btn-secondary').addClass('btn-sm btn-dark').html('<i class="fas fa-print"></i>');
				
				$('.select2').select2();
				$('.select2bs4').select2({
					theme: 'bootstrap4'
				});
				
				$('.select2-tags').select2({
					tags: true,
					width: '100%'
				});
				$('.select2bs4-tags').select2({
					theme: 'bootstrap4',
					tags: true,
					width: '100%'
				});
				
				$('.datetimepicker').datetimepicker();
				
				$('.datepicker').datetimepicker({
					format: 'YYYY-MM-DD',
				});
				
				$('.yearpicker').datetimepicker({
					format: 'YYYY',
				});
				
				$('.timepicker').datetimepicker({
					format: 'LT'
				});
				
				// $('input[name="daterange"]').daterangepicker({
				//   autoUpdateInput: false,
				//   locale: {
				//     cancelLabel: 'Clear',
				//     format: 'YYYY-MM-DD'
				//   }
				// });
				
				$('input[name="daterange"]').daterangepicker({
					autoUpdateInput: false,
					ranges: {
						'Today': [moment(), moment()],
						'Yeasterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
						'Last 7 Days': [moment().subtract(6, 'days'), moment()],
						'Last 30 Days': [moment().subtract(29, 'days'), moment()],
						'Current Month': [moment().startOf('month'), moment().endOf('month')],
						'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
						'Current Year': [moment().startOf('year'), moment().endOf('year')],
						'Last Year': [moment().subtract(1, 'year').startOf('year'), moment().subtract(1, 'year').endOf('year')],
					},
					locale: {
						cancelLabel: 'Clear',
						applyLabel: 'Ok',
						format: 'YYYY-MM-DD'
					}
				});
				
				$('input[name="daterange"]').attr('autocomplete','off');
				
				$('input[name="daterange"]').on('apply.daterangepicker', function(ev, picker) {
					$(this).val(picker.startDate.format('YYYY-MM-DD') + ' - ' + picker.endDate.format('YYYY-MM-DD'));
				});
				
				$('input[name="daterange"]').on('cancel.daterangepicker', function(ev, picker) {
					$(this).val('');
				});
				
				$('input[name="daterange"]').on('apply.daterangepicker', function(ev, picker) {
					$(this).val(picker.startDate.format('YYYY-MM-DD') + ' - ' + picker.endDate.format('YYYY-MM-DD'));
				});
				
				$('input[name="daterange"]').on('cancel.daterangepicker', function(ev, picker) {
					$(this).val('');
				});
				
				
				
				$('.checkbox-parent').change(function() {
					if($(this).is(':checked')){
						$('.checkbox-child').prop('checked',true);
						}else{
						$('.checkbox-child').prop('checked',false);
					}
				});
				
				$('.note').summernote();
			});

			function submitAForm(form, button){
				button.attr('disabled', 'disabled');
			    $.ajax({
			    	url: form.attr('action'),
			    	type: form.attr('method'),
			    	dataType: 'json',
			    	data: form.serializeArray(),
			    })
			    .done(function(response) {
			    	console.log(response);
			    	if(response.success){
			    		if(response.redirect){
			    			window.open(response.redirect_url, "_parent");
			    		}else{
			    			if(!response.hold){
			    				location.reload();
			    			}

			    			if(response.message){
			    				notify(response.message,'success');
			    			}
			    		}
			    	}else{
			    		notify(response.message,'danger');
			    	}
			    	button.removeAttr('disabled');
			    })
			    .fail(function(response) {
			    	$.each(response.responseJSON.errors, function(index, val) {
			    		notify(val[0],'danger');
			    	});
			    	button.removeAttr('disabled');
			    });
			}
			
			function Show(title,link,style = '') {
				$('#modal').modal();
				$('#modal-title').html(title);
				$('#modal-body').html('<h1 class="text-center"><strong>Please wait...</strong></h1>');
				$('#modal-dialog').attr('style',style);
				$.ajax({
					url: link,
					type: 'GET',
					data: {},
				})
				.done(function(response) {
					$('#modal-body').html(response);
				});
			}
			
			
			function Popup(title,link) {
				$.dialog({
					title: title,
					content: 'url:'+link,
					animation: 'scale',
					columnClass: 'large',
					closeAnimation: 'scale',
					backgroundDismiss: true,
				});
			}
			
			function ToggleStatus(button, table, id){
				$.confirm({
					title: 'Confirm!',
					content: '<hr><div class="alert alert-danger">Are you sure ?</div><hr>',
					buttons: {
						yes: {
							text: 'Yes',
							btnClass: 'btn-success',
							action: function(){
								$.ajax({
									url: "{{ url('dashboard/toggle-status') }}",
									type: 'POST',
									data: {_token: "{{ csrf_token() }}", table:table, id:id},
								})
								.done(function(response) {
									if(response.success){
										button.removeClass(response.old_class);
										button.addClass(response.new_class);
										button.html(response.new_text);
										notify(response.message,'success');
										}else{
										notify(response.message,'danger');
										playTone('danger');
									}
								})
								.fail(function(response){
									notify('Something went wrong!','danger');
									playTone('danger');
								});
							}
						},
						no: {
							text: 'No',
							btnClass: 'btn-default',
							action: function(){
								
							}
						}
					}
				});
			}
			
			function Delete(id,link) {
				$.confirm({
					title: 'Confirm!',
					content: '<hr><div class="alert alert-danger">Are you sure to delete ?</div><hr>',
					buttons: {
						yes: {
							text: 'Yes',
							btnClass: 'btn-danger',
							action: function(){
								$.ajax({
									url: link+"/"+id,
									type: 'DELETE',
									data: {_token:"{{ csrf_token() }}"},
								})
								.done(function(response) {
									if(response.success){
										$('#tr-'+id).fadeOut();
										notify('Data has been deleted','success');
										playTone('success');
										}else{
										notify('Something went wrong!','danger');
										playTone('danger');
									}
								})
								.fail(function(response){
									notify('Something went wrong!','danger');
									playTone('danger');
								});
							}
						},
						no: {
							text: 'No',
							btnClass: 'btn-default',
							action: function(){
								
							}
						}
					}
				});
			}
			
			function notify(message,type) {
				$.wnoty({
					message: '<strong class="text-'+(type)+'">'+(message)+'</strong>',
					type: type,
					autohideDelay: 3000
				});
			}
			
			function playTone(which) {
				var sound = "{{auth()->user()->sound}}";
				if(sound == 1){
					var obj = document.createElement("audio");
					obj.src = "{{url('public/lte/tones')}}/"+(which)+".mp3"; 
					obj.play(); 
				}
			}
			
			function openLink(link,type='_parent'){
				window.open(link,type);
			}

			function filterNumber(number) {
				number = number.toString();
				number = number.replace(' ', '');
				number = number.replace(',', '');
				number = number.replace(',', '');
				number = number.replace('.', '.');
				
				var dot_array = number.split('.');
				number = dot_array[0];
				number = dot_array.length > 1 ? number = dot_array[0]+'.'+dot_array[1] : number;
				
				
				var english_array = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.'];
				var bangla_array = ['০','১','২','৩','৪','৫','৬','৭','৮','৯', '.'];
				
				var final_number='';
				var number_array = number.split('');
				$.each(number_array, function(index, val) {
					if($.inArray(val, bangla_array) !== -1 || $.inArray(val, english_array) !== -1){
						final_number+=val;
					}
				});
				
				return final_number;
			}
			
			function en2bn(number){
				number = filterNumber(number);
				
				let english_array = {
					'0': '০',
					'1': '১',
					'2': '২',
					'3': '৩',
					'4': '৪',
					'5': '৫',
					'6': '৬',
					'7': '৭',
					'8': '৮',
					'9': '৯'
				}
				
				for (var x in english_array) {
					number = number.replace(new RegExp(x, 'g'), english_array[x]);
				}
				
				return number;
			}
			
			function bn2en(number){
				number = filterNumber(number);
				
				let bangla_array = {
					'০': 0,
					'১': 1,
					'২': 2,
					'৩': 3,
					'৪': 4,
					'৫': 5,
					'৬': 6,
					'৭': 7,
					'৮': 8,
					'৯': 9
				}
				
				for (var x in bangla_array) {
					number = number.replace(new RegExp(x, 'g'), bangla_array[x]);
				}
				
				return number;
			}
		</script>
	</body>
</html>
