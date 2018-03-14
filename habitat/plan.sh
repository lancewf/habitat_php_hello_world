# This file is the heart of your application's habitat.
# See full docs at https://www.habitat.sh/docs/reference/plan-syntax/
pkg_name=lemp
pkg_origin=lancewf
pkg_version="0.2.0"
pkg_maintainer="Lance Finfrock <lfinfrock@chef.io>"
pkg_license=('Apache-2.0')
pkg_source=""

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_deps=(core/nginx core/mysql-client)

pkg_binds=(
  [database]="port username password"
  [php-fpm]="port bind"
)

do_build(){
  return 0
}

do_install() {
  mkdir $pkg_prefix/static
  cp -r src/* $pkg_prefix/static/.
  mkdir $pkg_prefix/database
  cp -r habitat/database/* $pkg_prefix/database/.
}