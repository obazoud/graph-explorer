%import json
%#TODO print target_types on this page

  <div class="container">
%include snippet.errors errors=errors
     <a href="/debug/metrics">cached metrics</a>
     <div class="row">
        <div class="span12">
          <h2>Plugins</h2>
          <table class="table table-condensed">
%for plugin in sorted(plugin_names):
            <tr><td>{{plugin}}<a href="index/plugin={{plugin}}"> <i class="icon-zoom-in icon-white"></i></a></td></tr>
%end
          </table>
       </div>
     </div>
     <div class="row">
        <div class="span6">
	<h2>Graphs</h2>
          <table class="table table-condensed">
		<tr><th>name</th></tr>
%for name in sorted(graphs.iterkeys()):
       %data = json.dumps(graphs[name],indent=1)
               <tr><td>
                       <a href="#" data-toggle="collapse" data-target="#graph-{{name}}">{{name}}</a>
                       <div id="graph-{{name}}" class="collapse"><pre>{{data}}</pre></div>
               </td></tr>
%end
	</table>
       </div>
        <div class="span6">
	<h2>Graphs from targets</h2>
          <table class="table table-condensed">
		<tr><th>options</th></tr>
		<tr><td><pre>{{graphs_targets_options}}</pre></td></tr>
		<tr><th>name</th></tr>
%for name in sorted(graphs_targets.iterkeys()):
       %id = name.replace(' ','') # disallowed in var names
       %data = json.dumps(graphs_targets[name],indent=1)
               <tr><td>
                       <a href="#" data-toggle="collapse" data-target="#graph-{{id}}">{{name}}</a>
                       <div id="graph-{{id}}" class="collapse"><pre>{{data}}</pre></div>
               </td></tr>
%end
	</table>
       </div>
   </div>
   <div class="row">
        <div class="span12">
          <h2>Targets</h2>
          <table class="table table-condensed">
		<tr><th><b>id</b><br/>&gt; <i>target</i></th><th>tags</th></tr>
%for id in sorted(targets.iterkeys()):
	% data = targets[id]
		<tr>
			<td><b>{{id}}</b><br/><br/>&gt; <i>{{data['target']}}</i></td>
			<td>
	%for tag_key in sorted(data['tags'].iterkeys()):
		% tag_val = data['tags'][tag_key]
			{{tag_key}} : {{tag_val}}<br/>
	%end
			</td>
		</tr>
%end
          </table>
       </div>
      </div>
    </div> <!-- /container -->

