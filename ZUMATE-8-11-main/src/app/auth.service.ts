import { Injectable } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private cookieService: CookieService) {}

  login(token: string) {
    // Guarda el token de autenticación en una cookie
    this.cookieService.set('authToken', token, { path: '/', secure: true, sameSite: 'Lax' });
  }

  logout() {
    // Elimina la cookie de autenticación
    this.cookieService.delete('authToken', '/');
  }

  isLoggedIn(): boolean {
    return this.cookieService.check('authToken'); // Verifica si la cookie existe
  }
}
