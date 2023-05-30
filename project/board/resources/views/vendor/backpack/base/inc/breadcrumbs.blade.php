@if (config('backpack.base.breadcrumbs') && isset($breadcrumbs) && is_array($breadcrumbs) && count($breadcrumbs))
	<nav aria-label="breadcrumb" class="d-lg-block">
	  <ol class="breadcrumb bg-transparent p-0 justify-content-start">
	  	@foreach ($breadcrumbs as $label => $link)
	  		@if ($link)
			    <li class="breadcrumb-item text-capitalize"><a href="{{ $link }}">{{ $label }}</a></li>
	  		@else
			    <li class="breadcrumb-item text-capitalize active" aria-current="page">{{ $label }}</li>
	  		@endif
	  	@endforeach
	  </ol>
	</nav>
@endif
