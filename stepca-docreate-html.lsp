<% local view, viewlibrary, page_info = ... %>
<% htmlviewfunctions = require("htmlviewfunctions") %>
<% html = require("acf.html") %>

<h1>Create New Certificate</h1>

<% if view.error then %>
<div class="alert alert-danger">
	<strong>Error:</strong> <%= html.html_escape(view.error.value) %>
</div>
<div class="form-group">
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/createcert") %>"
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
	<h4>Certificate Created Successfully!</h4>
	<p><strong>Certificate:</strong> <%= html.html_escape(view.cert_path.value) %></p>
	<p><strong>Private Key:</strong> <%= html.html_escape(view.key_path.value) %></p>
</div>
<div class="form-group">
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/createcert") %>"
		class="btn btn-primary">
		<i class="icon-plus"></i> Create Another Certificate
	</a>
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/listcerts") %>"
		class="btn btn-default">
		View All Certificates
	</a>
</div>
<% else %>
<div class="alert alert-warning">
	<p>No result data available.</p>
</div>
<div class="form-group">
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/createcert") %>"
		class="btn btn-primary">
		<i class="icon-arrow-left"></i> Back to Form
	</a>
</div>
<% end %>
