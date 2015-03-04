<div class="panel panel-primary" style="margin:0px;">
  <div class="panel-heading"><h2>Please sign in</h2></div>
  <div class="panel-body">
    <form>
      <div class="form-group row">
        <div class="col-sm-2">
          <label class="control-label">Username</label>
        </div>
        <div class="col-sm-10">
          <input type="text" class="form-control" placeholder="username" required autofocus ng-model="user">
        </div>
      </div>
      <div class="form-group row">
        <div class="col-sm-2"> 
          <label class="control-label">Password</label>
        </div>
        <div class="col-sm-10">
          <input type="password" class="form-control" placeholder="Password" required ng-model="password">
        </div>
      </div>
    </form>
  </div>
  <div class="panel-footer" style="height:66px;">
    <button class="btn btn-danger btn-lg pull-left" ng-click="cancel()">Cancel</button>    
    <button class="btn btn-success btn-lg pull-right" ng-click="login()">Sign in</button>
  </div>
</div>