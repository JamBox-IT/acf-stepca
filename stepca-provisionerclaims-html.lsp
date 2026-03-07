<% local view, viewlibrary, page_info = ... %>
<% html = require("acf.html") %>

<h1>Manage Limits for Provisioner: <%= html.html_escape(view.prov_name.value) %></h1>

<% if view.error then %>
<div class="alert alert-danger">
	<strong>Error:</strong> <%= html.html_escape(view.error.value) %>
</div>
<% end %>

<% if view.success then %>
<div class="alert alert-success">
	<strong>Success!</strong> <%= html.html_escape(view.success.value) %>
	<div style="margin-top: 10px;">
		<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/restart") %>" 
		   class="btn btn-success btn-xs"
		   style="display: inline-block; padding: 5px 10px; font-size: 12px; color: #fff; background-color: #5cb85c; border: 1px solid #4cae4c; border-radius: 3px; text-decoration: none;">
			<i class="icon-refresh"></i> <%= view.is_running and "Reload" or "Start" %> step-ca Now
		</a>
	</div>
</div>
<% end %>

<% if view.has_jq and view.has_jq.value == "false" then %>
<div class="alert alert-warning">
	<strong>Advanced configuration requires 'jq'.</strong>
	<p>Please install it on your server: <code>apk add jq</code></p>
	<p>You can currently view the settings, but saving is disabled.</p>
</div>
<% end %>

<form method="POST" action="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/saveprovisionerclaims") %>">
	<input type="hidden" name="prov_name" value="<%= html.html_escape(view.prov_name.value) %>">

	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">X.509 Certificate Duration Limits</h3>
		</div>
		<div class="panel-body">
			<p><small class="text-muted">Format examples: 5m, 1h, 24h, 30d, 365d. These limits MUST be less than or equal to the Global CA Limits.</small></p>
			
			<div class="form-group" style="margin-bottom: 20px;">
				<label for="x509_min"><%= html.html_escape(view.x509_min.label) %></label>
				<input type="text" id="x509_min" name="x509_min" value="<%= html.html_escape(view.x509_min.value) %>" size="15">
				<br><small class="text-muted"><%= html.html_escape(view.x509_min.descr) %></small>
			</div>

			<div class="form-group" style="margin-bottom: 20px;">
				<label for="x509_max"><%= html.html_escape(view.x509_max.label) %></label>
				<input type="text" id="x509_max" name="x509_max" value="<%= html.html_escape(view.x509_max.value) %>" size="15">
				<br><small class="text-muted"><%= html.html_escape(view.x509_max.descr) %></small>
			</div>

			<div class="form-group" style="margin-bottom: 20px;">
				<label for="x509_def"><%= html.html_escape(view.x509_def.label) %></label>
				<input type="text" id="x509_def" name="x509_def" value="<%= html.html_escape(view.x509_def.value) %>" size="15">
				<br><small class="text-muted"><%= html.html_escape(view.x509_def.descr) %></small>
			</div>
		</div>
	</div>

	<div class="form-group">
		<button type="submit" class="btn btn-primary" <% if view.has_jq and view.has_jq.value == "false" then %>disabled<% end %> style="display: inline-block; padding: 6px 12px; font-size: 14px; color: #fff; background-color: #337ab7; border: 1px solid #2e6da4; border-radius: 4px;">
			<i class="icon-save"></i> Save Provisioner Limits
		</button>
		<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/templates") %>" 
		   class="btn btn-default"
		   style="display: inline-block; padding: 6px 12px; font-size: 14px; color: #333; background-color: #fff; border: 1px solid #ccc; border-radius: 4px; text-decoration: none; margin-left: 10px;">
			Cancel
		</a>
	</div>
</form>
