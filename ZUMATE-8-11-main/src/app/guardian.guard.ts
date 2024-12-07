import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service'; // Necesitarás instalar ngx-cookie-service

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {

  constructor(private router: Router, private cookieService: CookieService) {}

  canActivate(): boolean {
    const token = this.cookieService.get('authToken'); // Cambia 'authToken' por el nombre de tu cookie
    if (!token) {
      this.router.navigate(['/login']); // Redirige a la página de login si no está autenticado
      return false;
    }
    return true;
  }
}
