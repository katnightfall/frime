# UPDATE v1.1 - 6/8/2025:
- Fixed issue with bubbles not playing for the person bathing.
- Synced particle effect for bean diarrhea animation.
- Fixed issue with camp blip not removing when prop is removed.
- Added camp stash object option.
- Fixed error with HasItem check.
- Corrected model for item "lc_campfire_b".

NOTE: The stash items should only be used if you have PersistentProps enabled. Otherwise, players
will lose the stash and all items in it if the resource is restarted because the props aren't being
saved to the database and are only temporary.

# Be sure to add the new item "lc_campsafe_a" to your items and the image to your inventory images folder if updating!