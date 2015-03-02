{% extends "base.tpl" %}
{% block head %}
{{ super() }}
<style type="text/css">
.jumbotron{
  padding-bottom: 80px;
  padding-top: 1px;
}
h2{
  text-align: left;
}
</style>
{% endblock%}
{% block title %}Add Punch{% endblock %}
{% block addPage %}active{% endblock %}
{% block container %}
<h2>Punch</h2>
<form class="form-horizontal" ng-controller="punchController">
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
      <select ng-model="statusText" class="form-control" ng-change="updateStatus()">
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
  <a href="/" class="btn btn-primary pull-left" role="button">Back</a>
  <button class="btn btn-success pull-right" ng-click="save()">Save</button>
</form>
{% endblock %}
{% block details %}
<div ng-show="recentPunches.length > 0">
  <h4>Recently saved</h4>
  <table class="table" >
    <tr>
      <th>Punch</th>
      <th>System</th>
      <th>Tag</th>
      <th>Category</th>
      <th>Status</th>
      <th>Description</th>
      <th>Attendance</th>
      <th>Responsible</th>
    </tr>
    <tr ng-repeat="punch in recentPunches">
      <td>{[{punch.id}]}</td>
      <td>{[{punch.system}]}</td>
      <td>{[{punch.tag}]}</td>
      <td>{[{punch.category}]}</td>
      <td>{[{punch.getStatusText()}]}</td>
      <td>{[{punch.description}]}</td>
      <td>{[{punch.attendance}]}</td>
      <td>{[{punch.responsible}]}</td>
    </tr>
  </table>
</div>
{% endblock %}