https://docs.anycable.io/#/v1/


Những điều cần lưu ý
1) config `action_cable_meta_tag`
2) Config to deploy heroku
https://docs.anycable.io/#/deployment/heroku
  * Có 3 options:
    - Dùng 2 app: 1 cho rails, 1 cho anycable 
    - Dùng AnycableRack 
    - Dùng Action Cable (thường cho review app)
3) Config with Stimulux Reflex
https://docs.anycable.io/#/rails/stimulus_reflex

4) Rubocop for Anycable 
bundle exec rubocop -r 'anycable/rails/compatibility/rubocop' --only AnyCable/InstanceVars,AnyCable/PeriodicalTimers,AnyCable/InstanceVars
