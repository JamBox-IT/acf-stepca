<% local view, viewlibrary, page_info = ... %>
<% htmlviewfunctions = require("htmlviewfunctions") %>
<% html = require("acf.html") %>

<h1>Certificate Authority Setup</h1>

<% if view.error then %>
<div class="alert alert-danger">
	<h4>Error</h4>
	<p><strong><%= html.html_escape(view.error.value) %></strong></p>
	<div class="form-group">
		<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/setup") %>" class="btn btn-default">
			Back to Setup
		</a>
	</div>
</div>
<% end %>

<% if view.success then %>
<div class="alert alert-success">
	<h4><%= html.html_escape(view.success.label) %></h4>
	<p><%= html.html_escape(view.success.value) %></p>
</div>

<% if view.ca_password then %>
<div class="alert alert-warning" style="border: 3px solid #f0ad4e; padding: 20px;">
	<h3 style="color: #d9534f;"><i class="icon-warning-sign"></i> <%= html.html_escape(view.ca_password.label) %></h3>
	<p><%= html.html_escape(view.ca_password.descr) %></p>

	<div class="form-group" style="margin: 20px 0;">
		<label style="font-weight: bold; font-size: 16px;">CA Master Password (click to select and copy):</label>
		<input type="text" class="form-control" readonly value="<%= html.html_escape(view.ca_password.value) %>"
			onclick="this.select();"
			style="font-family: monospace; font-size: 18px; padding: 15px; background: #f9f9f9; border: 2px solid #5bc0de; margin-top: 10px; width: 62%; max-width: 500px;">
	</div>

	<p style="color: #d9534f; font-weight: bold; font-size: 16px;">
		⚠️ This password will ONLY be shown ONCE! ⚠️
	</p>
	<p>Save it immediately in a secure password manager.</p>
</div>
<% end %>

<% if view.password_warning then %>
<div class="alert alert-info">
	<%= html.html_escape(view.password_warning.value) %>
</div>
<% end %>

<div class="form-group" style="margin-top: 30px;">
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/status") %>" class="btn btn-primary btn-lg">
		<i class="icon-ok"></i> Continue to PKI Manager
	</a>
</div>
<% end %>
