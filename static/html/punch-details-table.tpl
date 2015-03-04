<table class="table" >
  <tr>
    <th>Punch#</th>
    <th>System#</th>
    <th>Tag#</th>
    <th>Category</th>
    <th style="min-width:100px">Status</th>
    <th>Description</th>
    <th>Attendance</th>
    <th>Responsible</th>
    <th ng-show="arePunchesModifiable()"></th>
  </tr>
  <tr ng-repeat="punch in getPunches()">
    <td>{[{punch.id}]}</td>
    <td>{[{punch.system}]}</td>
    <td>{[{punch.tag}]}</td>
    <td>{[{punch.category}]}</td>
    <td>{[{punch.statusText()}]}
      <small ng-hide="punch.status">
        <br>by: {[{punch.modifiedBy}]}<br>on: {[{punch.modified}]}
      </small>
    </td>
    <td>{[{punch.description}]}</td>
    <td>{[{punch.attendance}]}</td>
    <td>{[{punch.responsible}]}</td>
    <td>
      <div ng-show="arePunchesModifiable()">
        <button ng-show="punch.status" class="btn btn-danger btn-sm" style="padding-left:5px;padding-right:5px;" ng-click="punch.close()">
          Open
        </button>
        <button ng-hide="punch.status" class="btn btn-success btn-sm" style="padding-left:5px;padding-right:5px;">
          Closed
        </button>
      </div>
    </td>
  </tr>
</table>