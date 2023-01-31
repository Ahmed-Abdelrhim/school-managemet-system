<x-guest-layout>
    <x-jet-authentication-card>
        <x-slot name="logo">
            <x-jet-authentication-card-logo/>
        </x-slot>

        @if (session('alert-type'))
            <div class="mb-4 font-medium text-sm text-green-600">
                {{ session('message') }}
            </div>
        @endif

        <x-jet-validation-errors class="mb-4"/>

        <form method="POST" action="{{ route('change.password.from.code',$id) }}">
            @csrf

            <div class="block">
                <x-jet-label for="password" value="{{ __('New Password') }}"/>
                <x-jet-input id="password" class="block mt-1 w-full" type="password" name="password"
                             :value="old('password')" required
                             autofocus/>
            </div>


            <div class="block">
                <x-jet-label for="password_confirmation" value="{{ __('Confirm-new Password') }}"/>
                <x-jet-input id="password_confirmation" class="block mt-1 w-full" type="password"
                             name="password_confirmation" :value="old('password_confirmation')" required
                             autofocus/>
            </div>

            <div class="flex items-center justify-end mt-4">
                <x-jet-button>
                    {{ __('Save') }}
                </x-jet-button>
            </div>
        </form>
    </x-jet-authentication-card>
</x-guest-layout>
<script>
    @if(Session::has('message'))
    var type = "{{ Session::get('alert-type','info') }}"
    switch (type) {
        case 'info':
            toastr.info(" {{ Session::get('message') }} ");
            break;

        case 'success':
            toastr.success(" {{ Session::get('message') }} ");
            break;

        case 'warning':
            toastr.warning(" {{ Session::get('message') }} ");
            break;

        case 'error':
            toastr.error(" {{ Session::get('message') }} ");
            break;
    }
    @endif
</script>
