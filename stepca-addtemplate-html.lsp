<% local view, viewlibrary, page_info = ... %>
<% html = require("acf.html") %>

<h1>Add New Template</h1>

<form method="POST" action="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/savetemplate") %>">
	
	<div class="row">
		<div class="col-md-4">
			<div class="form-group">
				<label for="template_type"><%= html.html_escape(view.template_type.label) %></label>
				<select id="template_type" name="template_type" class="form-control" onchange="updatePrefix()">
					<% for _, opt in ipairs(view.template_type.option) do %>
					<option value="<%= html.html_escape(opt) %>" <%= opt == view.template_type.value and "selected" or "" %>>
						<%= html.html_escape(opt) %>
					</option>
					<% end %>
				</select>
				<small style="color: #777;"><%= html.html_escape(view.template_type.descr) %></small>
			</div>
		</div>
		<div class="col-md-8">
			<div class="form-group">
				<label for="template_name"><%= html.html_escape(view.template_name.label) %> *</label>
				<div class="input-group">
					<span class="input-group-addon" id="type-prefix">x509-</span>
					<input type="text" id="template_name" name="template_name" value="<%= html.html_escape(view.template_name.value) %>" class="form-control" placeholder="wifi-leaf.tpl" required>
				</div>
				<small style="color: #777;"><%= html.html_escape(view.template_name.descr) %></small>
			</div>
		</div>
	</div>

	<script>
		function updatePrefix() {
			var type = document.getElementById('template_type').value;
			var prefixSpan = document.getElementById('type-prefix');
			if (type === 'none') {
				prefixSpan.style.display = 'none';
			} else {
				prefixSpan.style.display = 'table-cell';
				prefixSpan.innerText = type + '-';
			}
		}
		// Initialize on load
		updatePrefix();
	</script>

	<div class="form-group">
		<label for="content"><%= html.html_escape(view.content.label) %></label>
		<textarea id="content" name="content" rows="25" style="width: 100%; font-family: monospace; font-size: 13px; padding: 10px; border: 1px solid #ccc; border-radius: 4px; tab-size: 4;"><%= html.html_escape(view.content.value) %></textarea>
		<br><small style="color: #777;">Templates use Go text/template syntax and Sprig functions.</small>
	</div>

	<div class="form-group" style="margin-top: 20px;">
		<button type="submit" class="btn btn-success">
			<i class="icon-ok"></i> Create and Save Template
		</button>
		<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/templates") %>" class="btn btn-default">
			Cancel
		</a>
	</div>
</form>
