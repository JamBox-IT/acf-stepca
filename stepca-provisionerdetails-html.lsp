<% local view, viewlibrary, page_info = ... %>
<% html = require("acf.html") %>

<h1>Provisioner Details: <%= html.html_escape(view.prov_name.value) %></h1>

<% if view.error then %>
<div class="alert alert-danger">
	<strong>Error:</strong> <%= html.html_escape(view.error.value) %>
</div>
<button type="button" class="btn btn-default" onclick="window.location.href='<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/provisioners") %>'">Back to Provisioners</button>
<% else %>

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Claims & Policies</h3>
			</div>
			<div class="panel-body">
				<p>These claims define the issuance limits (e.g., certificate lifetimes) for this provisioner.</p>
				<pre style="background-color: #f8f8f8; border: 1px solid #ccc; padding: 10px; border-radius: 4px; overflow-x: auto;"><%= html.html_escape(view.claims_json.value) %></pre>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Options (Embedded Templates)</h3>
			</div>
			<div class="panel-body">
				<p>Provisioner-specific templates for X.509 and SSH certificates. These are <strong>embedded copies</strong> of the templates at the time of creation/update.</p>
				<pre style="background-color: #f8f8f8; border: 1px solid #ccc; padding: 10px; border-radius: 4px; overflow-x: auto;"><%= html.html_escape(view.options_json.value) %></pre>
			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Full JSON Configuration</h3>
			</div>
			<div class="panel-body">
				<pre style="background-color: #f8f8f8; border: 1px solid #ccc; padding: 10px; border-radius: 4px; overflow-x: auto;"><%= html.html_escape(view.full_json.value) %></pre>
			</div>
		</div>
	</div>
</div>

<div class="form-group" style="margin-top: 20px;">
	<button type="button" class="btn btn-info" onclick="window.location.href='<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/provisionerclaims?prov_name=" .. view.prov_name.value) %>'">
		<i class="icon-time"></i> Edit Claims
	</button>
	<button type="button" class="btn btn-default" onclick="window.location.href='<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/provisioners") %>'">
		Back to Provisioners
	</button>
</div>

<% end %>
