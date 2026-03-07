<% local view, viewlibrary, page_info = ... %>
<% htmlviewfunctions = require("htmlviewfunctions") %>
<% html = require("acf.html") %>

<h1>Certificate Expiration Tracking</h1>

<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Certificates by Expiration</h3>
	</div>
	<div class="panel-body">
		<% if view.count then %>
		<p>Total Certificates: <strong><%= html.html_escape(view.count.value) %></strong></p>
		<% end %>

		<% if view.certificates and #view.certificates > 0 then %>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Certificate</th>
					<th>Common Name</th>
					<th>Days Remaining</th>
					<th>Expiration Date</th>
					<th>Status</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<% for i, cert in ipairs(view.certificates) do %>
				<tr class="<% if cert.color.value == "red" then %>danger<% elseif cert.color.value == "yellow" then %>warning<% elseif cert.color.value == "green" then %>success<% end %>">
					<td><%= html.html_escape(cert.name.value) %></td>
					<td><%= html.html_escape(cert.subject.value) %></td>
					<td><strong><%= html.html_escape(cert.days_remaining.value) %></strong></td>
					<td><%= html.html_escape(cert.expiration_date.value) %></td>
					<td>
						<span class="label label-<% if cert.color.value == "red" then %>danger<% elseif cert.color.value == "yellow" then %>warning<% else %>success<% end %>">
							<%= html.html_escape(cert.status.value) %>
						</span>
					</td>
					<td>
						<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/viewcert?cert_name=" .. cert.name.value) %>"
							class="btn btn-xs btn-info">
							<i class="icon-eye-open"></i> View
						</a>
					</td>
				</tr>
				<% end %>
			</tbody>
		</table>
		<% else %>
		<div class="alert alert-info">
			No certificates found.
		</div>
		<% end %>
	</div>
</div>

<div class="alert alert-info">
	<h4>Color Coding:</h4>
	<ul>
		<li><span class="label label-danger">Red</span> - Expires in 7 days or less (CRITICAL)</li>
		<li><span class="label label-warning">Yellow</span> - Expires in 30 days or less (WARNING)</li>
		<li><span class="label label-success">Green</span> - More than 30 days remaining (OK)</li>
	</ul>
</div>

<div class="form-group">
</div>
