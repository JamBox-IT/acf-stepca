<% local view, viewlibrary, page_info = ... %>
<% htmlviewfunctions = require("htmlviewfunctions") %>
<% html = require("acf.html") %>
<h1>Export Certificate</h1>

<% if view.error then %>
<div class="alert alert-danger">
	<strong>Error:</strong> <%= html.html_escape(view.error.value) %>
</div>
<% else %>
<div class="alert alert-warning">
	<p>No content available to download.</p>
	<p><strong>Debug info:</strong></p>
	<pre>
view.content type: <%= type(view.content) %>
view.filename type: <%= type(view.filename) %>
<% if view.content then %>content length: <%= #tostring(view.content) %><% end %>
<% if view.filename then %>filename: <%= tostring(view.filename) %><% end %>
	</pre>
</div>
<% end %>

<div class="form-group">
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/listcerts") %>"
		class="btn btn-primary">
		<i class="icon-arrow-left"></i> Back to Certificates
	</a>
</div>
