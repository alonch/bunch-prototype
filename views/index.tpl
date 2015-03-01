{% extends "base.tpl" %}
{% block title %}Index{% endblock %}
{% block head %}
  {{ super() }}
  <style>
    .row{
      padding: 10px;
    }
  </style>

{% endblock %}
{% block container %}
    <div class="row">
      <div class="col-lg-6">
        <button class="btn btn-primary"><img src="/static/img/document.png" href="#"> Add punch </button>
      </div>
      <div class="col-lg-6">
        <button class="btn btn-primary"><img src="/static/img/switch.png" href="#"> Change Status </button>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-6">
        <button class="btn btn-primary"><img src="/static/img/printer.png" href="#"> Reports </button>
      </div>
      <div class="col-lg-6">
        <button class="btn btn-primary"><img src="/static/img/run.png" href="#"> Change Log </button>
      </div>
    </div>
    <div class="clearfix visible-lg"></div>
{% endblock %}