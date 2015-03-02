<div class="form-group">
  <label class="col-sm-2 control-label">System</label>
  <div class="col-sm-4">
    <input ng-model="punch.system" type="number" class="form-control" placeholder="ID of the System">
  </div>
  <label for="tag" class="col-sm-2 control-label">Tag</label>
  <div class="col-sm-4">
    <input ng-model="punch.tag" type="number" class="form-control" placeholder="ID of the Tag">
  </div>
</div>
<div class="form-group">
  <label class="col-sm-2 control-label">Category</label>
  <div class="col-sm-4">
    <select ng-model="punch.category" class="form-control">
      <option>A</option>
      <option>BSU</option>
      <option>BCC</option>
      <option>BCSU</option>
      <option>CBCC</option>
    </select>
  </div>
  <label class="col-sm-2 control-label">Status</label>
  <div class="col-sm-4">
    <select ng-model="punch.statusText" ng-model-options="{ getterSetter: true }" class="form-control" >
      <option>Open</option>
      <option>Closed</option>
    </select>
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