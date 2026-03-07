<% local view, viewlibrary, page_info = ... %>
<% htmlviewfunctions = require("htmlviewfunctions") %>
<% html = require("acf.html") %>

<h1>Certificate Templates</h1>

<div class="alert alert-info">
	<strong>📁 Templates:</strong> JSON/Go-Template files used to customize certificate issuance.
	<br>Location: <code>/etc/step-ca/templates/</code>
</div>

<div class="panel panel-default">
	<div class="panel-heading" style="display: flex; justify-content: space-between; align-items: center;">
		<h3 class="panel-title">Available Templates</h3>
		<button type="button" class="btn btn-xs btn-success" onclick="window.location.href='<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/addtemplate") %>'">
			<i class="icon-plus"></i> Add New Template
		</button>
	</div>
	<div class="panel-body">
		<% if view.count then %>
		<p>Total Templates Found: <strong><%= html.html_escape(view.count.value) %></strong></p>
		<% end %>

		<% if view.templates and #view.templates > 0 then %>
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>Template Name</th>
					<th>Full Path</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<% for i, tmpl in ipairs(view.templates) do %>
				<tr>
					<td><strong><%= html.html_escape(tmpl.name.value) %></strong></td>
					<td><code><%= html.html_escape(tmpl.path.value) %></code></td>
					<td>
						<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/edittemplate?template_name=" .. tmpl.name.value) %>"
							class="btn btn-xs btn-primary">
							<i class="icon-edit"></i> Edit
						</a>
						<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/deletetemplate?template_name=" .. tmpl.name.value) %>"
							class="btn btn-xs btn-danger"
							onclick="return confirm('Are you sure you want to delete template: ' + '<%= html.html_escape(tmpl.name.value) %>' + '?');">
							<i class="icon-trash"></i> Delete
						</a>
					</td>
				</tr>
				<% end %>
			</tbody>
		</table>
		<% else %>
		<div class="alert alert-warning">
			No template files found in the templates directory.
		</div>
		<% end %>
	</div>
</div>
