# Workout tracker

## DATABASE
### User
  hasmany workouts
	-name
	-age
	-email
	-password
	-weight
	-height
	

### Workout
  hasmany users
	-muscle_group
	-calories_burned
	-time

### routine
  belongs to user
  belongs to workout
	-user_id
	-workout_id

## NEXT STEPS
- validations 
- login/signup using omniauth
- create the rest of the views for workouts/routines
- nest it
- add "date" to the routine or "name" or something like that

## MOAAAR STEPS
- create methods for total minutes and total calories?
- add query to sort workouts by muscle group/alphabetically idk

## next:
- be able to delete
- show errors
- edit routines and workouts
- query