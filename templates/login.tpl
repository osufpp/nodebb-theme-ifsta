<!-- IMPORT partials/breadcrumbs.tpl -->

<div class="row">
	<!-- IF allowLocalLogin -->
	<div class="<!-- IF alternate_logins -->col-md-4<!-- ELSE -->col-md-12<!-- ENDIF alternate_logins -->">
		<div class="well well-lg">
			<h4>Admin Login</h4>
			<div class="alert alert-danger" id="login-error-notify" <!-- IF error -->style="display:block"<!-- ELSE -->style="display: none;"<!-- ENDIF error -->>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<strong>[[login:failed_login_attempt]]</strong>
				<p>{error}</p>
			</div>

			<form class="form-horizontal" role="form" method="post" target="login" id="login-form">
				<div class="form-group">
					<div class="col-lg-12">
						<input class="form-control" type="text" placeholder="{allowLoginWith}" name="username" id="username" autocorrect="off" autocapitalize="off" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-12">
						<input class="form-control" type="password" placeholder="[[user:password]]" name="password" id="password" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-12">
						<div class="checkbox">
							<label>
								<input type="checkbox" name="remember" id="remember" checked /> [[login:remember_me]]
							</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-12">
						<hr />
						<button class="btn btn-primary btn-lg btn-block" id="login" type="submit">[[global:login]]</button>
						<!-- IF allowRegistration -->
						<span>[[login:dont_have_account]] <a href="{config.relative_path}/register">[[register:register]]</a></span>
						<!-- ENDIF allowRegistration -->
						<!-- IF showResetLink -->
						&nbsp; <a id="reset-link" href="{config.relative_path}/reset">[[login:forgot_password]]</a>
						<!-- ENDIF showResetLink -->
					</div>
				</div>
			</form>

		</div>
	</div>
	<!-- ENDIF allowLocalLogin -->

	<!-- IF allowLocalLogin -->
	<div class="col-md-4">
		<div class="well well-lg">
			<h4>Staff Login</h4>
			<a rel="nofollow" target="_top" href="{config.relative_path}/auth/fpp">
				<img class="img-responsive" src="/images/fpp.png"/>
			</a>
		</div>
	</div>
	<!-- ENDIF allowLocalLogin -->

	<!-- IF alternate_logins -->
	<div class="<!-- IF allowLocalLogin -->col-md-4<!-- ELSE -->col-md-12<!-- ENDIF allowLocalLogin -->">
		<div class="well well-lg">
			<h4>Login</h4>
			<a rel="nofollow" target="_top" href="{config.relative_path}/auth/ifsta">
				<img class="img-responsive" src="/images/ifsta.png"/>
			</a>
		</div>
	</div>
	<!-- ENDIF alternate_logins -->
</div>