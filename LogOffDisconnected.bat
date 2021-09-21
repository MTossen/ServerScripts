# Log off users who are disconnected from a RDP session.

@echo off
for /f "tokens=1-7 delims=,: " %%a in ('query user ^| find /i "disc"') do logoff %%b
