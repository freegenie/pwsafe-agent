# WARNING: 

This software makes reading passwords from pwsafe less secure. 

# Pwsafe::Agent

This gem is a wrapper for pwsafe composed of two executables which aim 
to reduce the typing of the master password.

## How it works

A daemon is executed and a client interacts with it to save the master 
passwowrd for a specified amount of time. At any later invocation, the
client asks the daemon for the master password. 

Client and server communication is operated across a unix socket. 

Master password is expired after 10 minutes.

Any printed output is saved to temporary file into `~/.pwsafe-agent/tmp` only for 
the time required for the client program to execute. This is impossible to avoid
given the way pwsafe is designed. If you find any better solution, your contribution 
is more than welcome.

Server pid is saved at `~/.pwsafe-agent/pid`

## Usage

    pwsafe-client [any-pwsafe-option] 
    
Examples: 
  
    pwsafe-client --list heroku
    
You can avoid the saving of master password to the server, or flush the saved password 
by passing `--flush` option to the client, even in conjunction with any pwsafe command: 

    pwsafe-client -up amazon --flush
    
    
## Installation
  
    gem install pwsafe-agent
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
