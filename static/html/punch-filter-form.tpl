<style type="text/css">
.btn-default-size{
  padding-bottom: 6px !important;
  padding-left: 12px !important;
  padding-right: 12px !important;
  padding-top: 6px !important;
  font-size: 14px !important;
}
.checkbox{
  margin-top: 10px;
  text-align: left;
  font-size: 16px;
}
</style>
<div class="form-group ">
  <label class="col-sm-2 control-label">System</label>
  <div class="col-sm-10">
    <div class="input-group ">
    <input ng-model="punchFilter.systems" type="text" class="form-control" placeholder="IDs of the Systems to show">
    <span class="input-group-btn">
      <button class="btn btn-danger btn-default-size" type="button" ng-click="selectIDs('systems')">
        <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 
        Find
      </button>
    </span>
    </div>  
  </div>
</div>
<div class="form-group ">
  <label class="col-sm-2 control-label">Tags</label>
  <div class="col-sm-10">
    <div class="input-group ">
      <input ng-model="punchFilter.tags" type="text" class="form-control" placeholder="IDs of the Tags to show">
      <span class="input-group-btn">
        <button class="btn btn-danger btn-default-size" type="button" ng-click="selectIDs('tags')">
          <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 
          Find
        </button>
      </span>
    </div>  
  </div>
</div>
<div class="form-group">
  <label class="col-sm-2 control-label">Category</label>
  <div class="col-sm-2">
    <button class="btn btn-default-size" type="button" ng-click="checkAll('categories')">
      Check All
    </button>
  </div>
  <div class="col-sm-2">
    <button class="btn btn-default-size" type="button" ng-click="uncheckAll('categories')">
      Uncheck All
    </button>
  </div>
  <div class="clearfix"></div>
  <div class="col-sm-offset-3 col-sm-3 checkbox">
    <input type="checkbox" ng-model="punchFilter.categories.a"> A
  </div>
  <div class="col-sm-3 checkbox">
    <input type="checkbox" ng-model="punchFilter.categories.bsu"> BSU
  </div>
  <div class="col-sm-3 checkbox">
    <input type="checkbox" ng-model="punchFilter.categories.bcc"> BCC
  </div>
  <div class="clearfix"></div>
  <div class="col-sm-offset-3 col-sm-3 checkbox">
    <input type="checkbox" ng-model="punchFilter.categories.bcsu"> BCSU
  </div>
  <div class="col-sm-3 checkbox">
    <input type="checkbox" ng-model="punchFilter.categories.cbcc"> CBCC
  </div>
</div>
<div class="form-group">
  <label class="col-sm-2 control-label">Status</label>
  <div class="col-sm-2">
    <button class="btn btn-default-size" type="button" ng-click="checkAll('statuses')">
      Check All
    </button>
  </div>
  <div class="col-sm-2">
    <button class="btn btn-default-size" type="button" ng-click="uncheckAll('statuses')">
      Uncheck All
    </button>
  </div>
  <div class="clearfix"></div>
  <div class="col-sm-offset-3 col-sm-3 checkbox">
    <input type="checkbox" ng-model="punchFilter.statuses.open"> Open
  </div>
  <div class="col-sm-3 checkbox">
    <input type="checkbox" ng-model="punchFilter.statuses.closed"> Closed
  </div>
</div> 
<div class="form-group">
  <label class="col-sm-2 control-label">Description</label>
  <div class="col-sm-10">
    <input ng-model="punch.description" type="text" class="form-control" placeholder="Description...">
  </div>
</div>

<div class="form-group">
  <label class="col-sm-4 control-label">Attendance FE CSU</label>
  <div class="col-sm-8">
    <input ng-model="punch.attendance" type="text" class="form-control" placeholder="Attendance FE CSU">
  </div>
</div>
<div class="form-group">
  <label class="col-sm-4 control-label">Responsible to Fix</label>
  <div class="col-sm-8">
    <input ng-model="punch.responsible" type="text" class="form-control" placeholder="Responsible to Fix">
  </div>
</div>