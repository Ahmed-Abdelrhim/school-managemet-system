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


        @if (session('status'))
            <div class="mb-4 font-medium text-sm text-green-600">
                {{ session('status') }}
            </div>
        @endif

        <x-jet-validation-errors class="mb-4"/>

        <form method="POST" action="{{ route('verify.user.forget.password.code',encrypt($user_email)) }}">
            @csrf

            <div class="block">
                <x-jet-label for="code" value="{{ __('Enter Code') }}"/>
                <x-jet-input id="code" class="block mt-1 w-full" type="text" name="code" :value="old('text')" required
                             autofocus/>
            </div>

            <div class="flex items-center justify-end mt-4">
                <x-jet-button>
                    {{ __('Verify') }}
                </x-jet-button>
            </div>
        </form>
    </x-jet-authentication-card>
</x-guest-layout>
