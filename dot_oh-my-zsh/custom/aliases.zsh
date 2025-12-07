alias be='bundle exec'
alias bi='bundle install'
alias gaac='gaa && gcam'
alias dkill='docker stop $(docker ps -a -q)'
alias dnuke='docker rm $(docker ps -a -q)'
alias dvoid='docker rmi $(docker images -q)'
alias ddrop='docker volume rm $(docker volume ls -q)'
alias dunlink='docker network rm $(docker network ls -q)'
alias dbb='dkill; dnuke; dvoid; dunlink; ddrop'
alias dpru='docker system prune'
# usage:
# whatisusing 3000
function whatisusing() {
  lsof -i tcp:$1 
}
alias prune_oo='docker container prune --filter label="com.docker.compose.oneoff"="True"'
alias tg='terragrunt'
