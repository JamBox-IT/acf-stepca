<% local view, viewlibrary, page_info = ... %>
<% htmlviewfunctions = require("htmlviewfunctions") %>
<% html = require("acf.html") %>

<h1>Revoke Certificate</h1>

<% if view.error then %>
<div class="alert alert-danger">
	<strong>Error:</strong> <%= html.html_escape(view.error.value) %>
</div>
<div class="form-group">
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/revokecert") %>"
		class="btn btn-primary">
		<i class="icon-arrow-left"></i> Back to Form
	</a>
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/listcerts") %>"
		class="btn btn-default">
		View All Certificates
	</a>
</div>
<% elseif view.success then %>
<div class="alert alert-success">
	<h4>Certificate Revoked Successfully!</h4>
	<p><%= html.html_escape(view.success.value) %></p>
</div>
<% if view.log and view.log.value ~= "" then %>
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Revocation Details</h3>
	</div>
	<div class="panel-body">
		<pre><%= html.html_escape(view.log.value) %></pre>
	</div>
</div>
<% end %>
<div class="form-group">
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/viewcrl") %>"
		class="btn btn-primary">
		<i class="icon-list"></i> View Certificate Revocation List
	</a>
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/listcerts") %>"
		class="btn btn-default">
		<i class="icon-arrow-left"></i> Back to Certificate List
	</a>
</div>
<% else %>
<div class="alert alert-warning">
	<p>No result data available.</p>
</div>
<div class="form-group">
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/revokecert") %>"
		class="btn btn-primary">
		<i class="icon-arrow-left"></i> Back to Form
	</a>
</div>
<% end %>
