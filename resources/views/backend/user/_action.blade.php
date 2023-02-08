<a href="{{ route('users.edit',encrypt($user->id)) }}" class="btn btn-info">Edit</a>

<a href="{{ route('users.delete',$user->id) }}" class="btn btn-danger" id="delete">Delete</a>
