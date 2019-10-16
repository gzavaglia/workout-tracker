## Workout tracker

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
	-total time
	-user_id
	-workout_id
	-total_cal_butned