<% local view, viewlibrary, page_info = ... %>
<% htmlviewfunctions = require("htmlviewfunctions") %>
<% html = require("acf.html") %>

<h1>PKI Configuration</h1>

<% if view.error then %>
<div class="alert alert-danger">
	<strong>Error:</strong> <%= html.html_escape(view.error.value) %>
</div>
<div class="form-group">
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/config") %>"
		class="btn btn-primary">
		<i class="icon-arrow-left"></i> Back to Configuration
	</a>
</div>
<% elseif view.success then %>
<div class="alert alert-success">
	<h4>Configuration Saved Successfully!</h4>
	<p><%= html.html_escape(view.success.value) %></p>
	<% if view.critical_days and view.warning_days and view.notice_days then %>
	<hr>
	<p><strong>Current Thresholds:</strong></p>
	<ul>
		<li>Critical: <%= html.html_escape(view.critical_days.value) %> days</li>
		<li>Warning: <%= html.html_escape(view.warning_days.value) %> days</li>
		<li>Notice: <%= html.html_escape(view.notice_days.value) %> days</li>
	</ul>
	<% end %>
</div>
<div class="form-group">
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/config") %>"
		class="btn btn-primary">
		<i class="icon-edit"></i> Edit Configuration
	</a>
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller) %>"
		class="btn btn-default">
		<i class="icon-arrow-left"></i> Back to Dashboard
	</a>
</div>
<% else %>
<div class="alert alert-warning">
	<p>No result data available.</p>
</div>
<div class="form-group">
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/config") %>"
		class="btn btn-primary">
		<i class="icon-arrow-left"></i> Back to Configuration
	</a>
</div>
<% end %>
