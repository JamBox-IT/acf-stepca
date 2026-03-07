<% local view, viewlibrary, page_info = ... %>
<% html = require("acf.html") %>

<h1>Global Certificate Authority Claims</h1>

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

<form method="POST" action="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/saveauthorityclaims") %>">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">Global Authority Policy</h3>
		</div>
		<div class="panel-body">
			<p>These settings define the <strong>absolute maximum limits</strong> for all certificates issued by this CA, regardless of provisioner settings.</p>
			<p><small class="text-muted">Format: 5m, 24h, 365d, etc. (Examples: 365d = 1 year, 3650d = 10 years)</small></p>

			<div class="form-group" style="margin-bottom: 20px;">
				<label for="min_dur"><%= html.html_escape(view.min_dur.label) %></label>
				<input type="text" id="min_dur" name="min_dur" value="<%= html.html_escape(view.min_dur.value) %>" size="15">
				<br><small class="text-muted"><%= html.html_escape(view.min_dur.descr) %></small>
			</div>

			<div class="form-group" style="margin-bottom: 20px;">
				<label for="max_dur"><%= html.html_escape(view.max_dur.label) %></label>
				<input type="text" id="max_dur" name="max_dur" value="<%= html.html_escape(view.max_dur.value) %>" size="15">
				<br><small class="text-muted"><%= html.html_escape(view.max_dur.descr) %></small>
			</div>

			<div class="form-group" style="margin-bottom: 20px;">
				<label for="default_dur"><%= html.html_escape(view.default_dur.label) %></label>
				<input type="text" id="default_dur" name="default_dur" value="<%= html.html_escape(view.default_dur.value) %>" size="15">
				<br><small class="text-muted"><%= html.html_escape(view.default_dur.descr) %></small>
			</div>
		</div>
	</div>

	<div class="form-group">
		<button type="submit" class="btn btn-primary" <% if view.has_jq and view.has_jq.value == "false" then %>disabled<% end %> style="display: inline-block; padding: 6px 12px; font-size: 14px; color: #fff; background-color: #337ab7; border: 1px solid #2e6da4; border-radius: 4px;">
			<i class="icon-save"></i> Save Global Claims
		</button>
		<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/config") %>" 
		   class="btn btn-default"
		   style="display: inline-block; padding: 6px 12px; font-size: 14px; color: #333; background-color: #fff; border: 1px solid #ccc; border-radius: 4px; text-decoration: none; margin-left: 10px;">
			Cancel
		</a>
	</div>
</form>
