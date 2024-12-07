import { Component } from '@angular/core';

@Component({
  selector: 'app-blog',
  templateUrl: './blog.component.html',
  styleUrl: './blog.component.css'
})
export class BlogComponent {
  isSocialMenuVisible = false;

  toggleSocialMenu() {
    this.isSocialMenuVisible = !this.isSocialMenuVisible;
  }
}
