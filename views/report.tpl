{% extends "base.tpl" %}
{% block title %}Print Punches{% endblock %}
{% block body %}
<div ng-controller='punchController' style="padding:20px" 
  ng-init='setPunches({{punches}})'>
  <h4><u>Punches Summary Report</u></h4>
  <div punch-details></div>
</div>
{% endblock %}
{% block onReady %}
  window.print();
{% endblock %}