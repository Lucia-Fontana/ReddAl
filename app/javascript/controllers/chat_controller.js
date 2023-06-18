import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ["messages"]

  // Function to scroll the chat container to the bottom
  function scrollChatToBottom() {
    const chatContainer = document.querySelector('#chat-container');
    chatContainer.scrollTop = chatContainer.scrollHeight;
  }

// AJAX submission of the form
  document.querySelector('#chat-form').addEventListener('submit', function(e) {
    e.preventDefault();
    const formData = new FormData(this);
    const message = formData.get('message');
    this.reset();

    fetch('/chat/converse', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: JSON.stringify({ message: message })
    })
    .then(response => response.json())
    .then(data => {
      const chatHistory = document.querySelector('#chat-history');
      const messageElement = document.createElement('p');
      messageElement.classList.add('bot');
      messageElement.innerText = 'Bot: ' + data.response;
      chatHistory.appendChild(messageElement);
      scrollChatToBottom();
    });
  });

  // Scroll chat to the bottom on initial page load
  window.addEventListener('load', scrollChatToBottom);

}
