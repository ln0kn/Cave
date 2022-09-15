<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class Stock extends Notification implements ShouldQueue
{
    use Queueable;

    /**
     * Create a new notification instance.
     *
     * @return void
     */

     private $details;
     private $pros;

    public function __construct($details,$pros)
    {
      // dd($pros);

        $this->details = $details;
        $this->pros = $pros;

    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail','database'];
        // return [,'mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        // return (new MailMessage)
        //             ->line('The introduction to the notification.')
        //             ->action('Notification Action', url('/'))
        //             ->line('Thank you for using our application!');

         // return (new Mailable($this->invoice))->to('lank9368@gmail.com');

      //     return (new MailMessage)->view(
      //     'mail', ['designation' => $this->pros,'qte'=> $this->details]
      // )->to('lank9368@gmail.com');


          return (new MailMessage)->view(
          'mail', ['designation' => $this->pros,'qte'=> $this->details]
      );
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            'data' => $this->pros,
            'data2' => $this->details,
        ];
    }
}
