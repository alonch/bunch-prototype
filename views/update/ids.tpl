
<div class="panel panel-primary" style="margin:0px;">
  <div class="panel-heading">Select Systems ID</div>
  <div class="panel-body">
    <div class="col-sm-2 col-sm-offset-2">
      <button class="btn" ng-click="changeAll(true)">Check All</button>
    </div>
    <div class="col-sm-2">
      <button class="btn" ng-click="changeAll(false)">Uncheck All</button>
    </div>
    <div class="clearfix"></div>
    {% for i in range(ids|count) %}
    <div class="col-sm-9 col-sm-offset-3 checkbox">
      <input ng-model="systems['{{ids[i]}}']" type="checkbox" class="btn" ng-init="systems['{{ids[i]}}']=true">
      {{ids[i]}} - {{names[i]}}
    </div>
    {% endfor %}
  </div>
  <div class="panel-footer" style="height:66px;">
    <button class="btn btn-danger btn-lg pull-left" ng-click="cancel()">Cancel</button>    
    <button class="btn btn-success btn-lg pull-right" ng-click="finish()">Select</button>
  </div>
</div>