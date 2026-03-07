<% local view, viewlibrary, page_info = ... %>
<% htmlviewfunctions = require("htmlviewfunctions") %>
<% html = require("acf.html") %>

<h1>Revocation List Refreshed</h1>

<% if view.error then %>
<div class="alert alert-danger">
	<strong>Error:</strong> <%= html.html_escape(view.error.value) %>
</div>
<% end %>

<% if view.success then %>
<div class="alert alert-success">
	<p><%= html.html_escape(view.success.value) %></p>
</div>
<% end %>

<fieldset>
	<legend>Revoked Certificates</legend>

	<% if view.revoked_list then %>
	<p>The following certificates are currently revoked:</p>
	<pre style="max-height: 400px; overflow-y: auto; padding: 10px; background-color: #f5f5f5; border: 1px solid #ddd;"><%= html.html_escape(view.revoked_list.value) %></pre>
	<% elseif view.no_revocations then %>
	<div class="alert alert-success">
		<%= html.html_escape(view.no_revocations.value) %>
	</div>
	<% end %>
</fieldset>

<div class="form-group" style="margin-top: 30px;">
	<form method="post" action="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/refreshcrl") %>" style="display: inline;">
		<button type="submit" class="btn btn-primary" style="display: inline-block; padding: 6px 12px; font-size: 14px; color: #fff; background-color: #337ab7; border: 1px solid #2e6da4; border-radius: 4px;">
			<i class="icon-refresh"></i> Refresh Again
		</button>
	</form>
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/listcerts") %>"
		class="btn btn-default"
		style="display: inline-block; padding: 6px 12px; font-size: 14px; color: #333; background-color: #fff; border: 1px solid #ccc; border-radius: 4px; text-decoration: none;">
		<i class="icon-list"></i> View All Certificates
	</a>
</div>
