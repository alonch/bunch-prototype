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
<form class="form-horizontal">
  <div class="form-group">
    <label for="system" class="col-sm-2 control-label">System</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="system" id="system" placeholder="ID of the System">
    </div>
    <label for="tag" class="col-sm-2 control-label">Tag</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="tag" id="tag" placeholder="ID of the Tag">
    </div>
  </div>
  <div class="form-group">
    <label for="system" class="col-sm-2 control-label">Category</label>
    <div class="col-sm-4">
      <select class="form-control">
        <option>A</option>
        <option>BSU</option>
        <option>BCC</option>
        <option>BCSU</option>
        <option>CBCC</option>
      </select>
    </div>
    <label for="tag" class="col-sm-2 control-label">Status</label>
    <div class="col-sm-4">
      <select class="form-control">
        <option>Open</option>
        <option>Closed</option>
      </select>
    </div>
  </div>  
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Description</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" placeholder="Description...">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-4 control-label">Attendance FE CSU</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" placeholder="Attendance FE CSU">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-4 control-label">Responsible to Fix</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" placeholder="Responsible to Fix">
    </div>
  </div>
  <a href="/" class="btn btn-primary pull-left" role="button">Back</a>
  <button class="btn btn-success pull-right">Save</button>
</form>
{% endblock %}
{% block details %}
<h4>Recently saved</h4>
<table class="table">
  <tr>
    <th>Punch ID</th>
    <th>System ID</th>
    <th>Tag ID</th>
    <th>Category</th>
    <th>Status</th>
    <th>Description</th>
    <th>Attendance</th>
    <th>Responsible</th>
  </tr>
  <tr>
    <td>1</td>
    <td>1</td>
    <td>1</td>
    <td>BSU</td>
    <td>Open</td>
    <td>egestas eget quam  tortor mauris condimentum nibh</td>
    <td>Alonso</td>
    <td>Stanley</td>
  </tr>
  <tr>
    <td>2</td>
    <td>1</td>
    <td>3</td>
    <td>BCSU</td>
    <td>Open</td>
    <td>Cras justo odio, dapibus ac facilisis in</td>
    <td>Alonso</td>
    <td>Stanley</td>
  </tr>
</table>
{% endblock %}

