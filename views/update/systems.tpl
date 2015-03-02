
<div class="panel panel-primary" style="margin:0px;">
  <div class="panel-heading">Select Systems ID</div>
  <div class="panel-body">
    <div class="col-sm-2 col-sm-offset-2">
      <button class="btn" ng-click="showSystems()">Check All</button>
    </div>
    <div class="col-sm-2">
      <button class="btn">Uncheck All</button>
    </div>
    <div class="clearfix"></div>
    {% for system in systems %}
    <div class="col-sm-9 col-sm-offset-3 checkbox">
      <input ng-model="systems['{{system}}']" type="checkbox" class="btn" checked>
      {{system}} - System Name
    </div>
    {% endfor %}
  </div>
</div>