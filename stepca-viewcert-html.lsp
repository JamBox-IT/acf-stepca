<% local view, viewlibrary, page_info = ... %>
<% htmlviewfunctions = require("htmlviewfunctions") %>
<% html = require("acf.html") %>

<h1>Certificate Details</h1>

<% if view.error then %>
	<div class="alert alert-danger">
		<strong>Error:</strong> <%= html.html_escape(view.error.value) %>
	</div>
	<div class="form-group">
		<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/listcerts") %>"
			class="btn btn-default">
			<i class="icon-arrow-left"></i> Back to Certificate List
		</a>
	</div>
<% else %>

<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Certificate Information</h3>
	</div>
	<div class="panel-body">
		<% if view.inspection then %>
		<pre><%= html.html_escape(view.inspection.value) %></pre>
		<% end %>
	</div>
</div>

<% if view.has_key and view.has_key.value == "true" then %>
<div class="alert alert-success">
	<i class="icon-ok"></i> <strong>Private Key Available:</strong> The private key for this certificate exists on the system.
</div>
<% else %>
<div class="alert alert-info">
	<i class="icon-info-sign"></i> <strong>Private Key:</strong> No private key found for this certificate (certificate-only import or CA certificate).
</div>
<% end %>

<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">PEM Content</h3>
	</div>
	<div class="panel-body">
		<% if view.pem then %>
		<pre style="max-height: 400px; overflow-y: auto;"><%= html.html_escape(view.pem.value) %></pre>
		<% end %>
	</div>
</div>

<div class="form-group" style="margin-top: 20px;">
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/listcerts") %>"
		class="btn btn-default"
		style="display: inline-block; padding: 6px 12px; font-size: 14px; color: #333; background-color: #fff; border: 1px solid #ccc; border-radius: 4px; text-decoration: none; margin-right: 10px;">
		<i class="icon-arrow-left"></i> Back to Certificate List
	</a>
	
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/exportcert?cert_name=" .. view.cert_name.value .. "&type=cert") %>"
		class="btn btn-success"
		style="display: inline-block; padding: 6px 12px; font-size: 14px; color: #fff; background-color: #5cb85c; border: 1px solid #4cae4c; border-radius: 4px; text-decoration: none; margin-right: 10px;">
		<i class="icon-download-alt"></i> Download Certificate (.crt)
	</a>

	<% if view.has_key and view.has_key.value == "true" then %>
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/exportcert?cert_name=" .. view.cert_name.value .. "&type=key") %>"
		class="btn btn-warning"
		style="display: inline-block; padding: 6px 12px; font-size: 14px; color: #fff; background-color: #f0ad4e; border: 1px solid #eea236; border-radius: 4px; text-decoration: none; margin-right: 10px;">
		<i class="icon-key"></i> Download Private Key (.key)
	</a>
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/exportcert?cert_name=" .. view.cert_name.value .. "&type=bundle") %>"
		class="btn btn-primary"
		style="display: inline-block; padding: 6px 12px; font-size: 14px; color: #fff; background-color: #337ab7; border: 1px solid #2e6da4; border-radius: 4px; text-decoration: none;">
		<i class="icon-briefcase"></i> Download Bundle (.pem)
	</a>
	<% end %>
</div>

<% end %>
